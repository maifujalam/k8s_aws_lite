import yaml
from deepdiff import DeepDiff
import sys
import os

def load_yaml(file_path):
    with open(file_path, "r") as f:
        return yaml.safe_load(f)

def sort_dict(d):
    """Recursively sort dictionaries by key"""
    if isinstance(d, dict):
        return {k: sort_dict(d[k]) for k in sorted(d.keys())}
    elif isinstance(d, list):
        return [sort_dict(x) for x in d]
    else:
        return d

def get_differences(defaults, overrides):
    diff = DeepDiff(defaults, overrides, ignore_order=True).to_dict()
    changes = {}

    for change_type in ["dictionary_item_added", "values_changed"]:
        if change_type in diff:
            items = diff[change_type].items() if isinstance(diff[change_type], dict) else [(k, None) for k in diff[change_type]]
            for key, value in items:
                path = key.replace("root", "").strip("[]").replace("][", ".").replace("'", "")
                parts = path.split(".")
                d = changes
                for p in parts[:-1]:
                    d = d.setdefault(p, {})
                if change_type == "values_changed":
                    d[parts[-1]] = value["new_value"]
                else:
                    cur = overrides
                    for p in parts:
                        cur = cur[p]
                    d[parts[-1]] = cur
    return changes

def main(default_file, override_file, output_file=None):
    defaults = load_yaml(default_file)
    overrides = load_yaml(override_file)

    differences = get_differences(defaults, overrides)

    # Sort the differences recursively
    differences = sort_dict(differences)

    if not output_file:
        output_file = os.path.join(os.getcwd(), "values.diff.yaml")

    with open(output_file, "w") as f:
        yaml.dump(differences, f, default_flow_style=False, sort_keys=False)

    print(f"Overrides written to {output_file}")

if __name__ == "__main__":
    if len(sys.argv) < 3 or len(sys.argv) > 4:
        print("Usage: python3 helm_values_diff.py values.yaml override.yaml[values.diff.yaml]")
        sys.exit(1)

    default_file = sys.argv[1]
    override_file = sys.argv[2]
    output_file = sys.argv[3] if len(sys.argv) == 4 else None

    main(default_file, override_file, output_file)
