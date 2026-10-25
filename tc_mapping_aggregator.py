def get_mappings(task, seed, split, max_mapping=10):
    data_path = f"./my_auto_label_mapping_cpt_200it/manual_template/{task}-{split}/16-{seed}.txt"
    mappings = open(data_path, mode="r", encoding='utf-8').read().split("\n")[:max_mapping]
    mappings = [eval(mapping) for mapping in mappings]
    return mappings


def aggregate_mappings(mappings1, mappings2):
    results = []
    for mapping1 in mappings1:
        for mapping2 in mappings2:
            mapping = {}
            mapping.update(mapping1)
            mapping.update(mapping2)
            mapping = {int(k): v for k,v in mapping.items()}
            results.append(mapping)
    return results


task = "persian_news_tc"


for seed in [13, 21, 42, 87, 100]:
    mapping_split_1 = get_mappings(task, seed, 1, 10)
    mapping_split_2 = get_mappings(task, seed, 2, 10)
    results = aggregate_mappings(mapping_split_1, mapping_split_2)
    with open(f"./my_auto_label_mapping_cpt_200it/manual_template/persian_news_tc_aggregate/16-{seed}.txt", "w",
              encoding="utf-8") as f:
        for result in results:
            f.write(f"{result}\n")
    print(f"seed: {seed} Done!")

