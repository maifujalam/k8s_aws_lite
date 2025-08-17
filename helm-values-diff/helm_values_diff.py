import yaml
from deepdiff import DeepDiff
import sys

def load_yaml(file_path):
    with open(file_path, "r") as f:
        return yaml.safe_load(f)

def get_differences(defaults, overrides):
    diff = DeepDiff(defaults, overrides, ignore_order=True).to_dict()

    # Extract only changed values (dictionary_item_added / values_changed)
    changes = {}

    for change_type in ["dictionary_item_added", "values_changed"]:
        if change_type in diff:
            for key, value in diff[change_type].items() if isinstance(diff[change_type], dict) else [(k, None) for k in diff[change_type]]:
                path = key.replace("root", "").strip("[]").replace("][", ".").replace("'", "")
                parts = path.split(".")
                d = changes
                for p in parts[:-1]:
                    d = d.setdefault(p, {})
                if change_type == "values_changed":
                    d[parts[-1]] = value["new_value"]
                else:  # added key
                    # Traverse overrides to fetch the real value
                    cur = overrides
                    for p in parts:
                        cur = cur[p]
                    d[parts[-1]] = cur
    return changes

def main(default_file, override_file, output_file):
    defaults = load_yaml(default_file)
    overrides = load_yaml(override_file)

    differences = get_differences(defaults, overrides)

    with open(output_file, "w") as f:
        yaml.dump(differences, f, default_flow_style=False, sort_keys=False)

    print(f"Overrides written to {output_file}")

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python diff_yaml.py default.yaml override.yaml output.yaml")
        sys.exit(1)
    main(sys.argv[1], sys.argv[2], sys.argv[3])
