import pandas as pd
import os


def generate_data_path(task, seed, mode="train"):
    return f"./data/k-shot/{task}/16-{seed}/{mode}.csv"


def split_data(data: pd.DataFrame):
    part1_data = data[data[2] <= 3]
    part2_data = data[data[2] > 3]
    return part1_data, part2_data


task = "persian_news_tc"

for seed in [13, 21, 42, 87, 100]:
    train_data = pd.read_csv(generate_data_path(task, seed, "train"), header=None)
    dev_data = pd.read_csv(generate_data_path(task, seed, "dev"), header=None)
    test_data = pd.read_csv(generate_data_path(task, seed, "test"), header=None)

    part1_train_data, part2_train_data = split_data(train_data)
    part1_dev_data, part2_dev_data = split_data(dev_data)
    part1_test_data, part2_test_data = split_data(test_data)

    os.makedirs(f"./data/k-shot/{task}-1/16-{seed}", exist_ok=True)
    os.makedirs(f"./data/k-shot/{task}-2/16-{seed}", exist_ok=True)

    part1_train_data.to_csv(generate_data_path(f"{task}-1", seed, "train"), index=False, header=None)
    part1_dev_data.to_csv(generate_data_path(f"{task}-1", seed, "dev"), index=False, header=None)
    part1_test_data.to_csv(generate_data_path(f"{task}-1", seed, "test"), index=False, header=None)

    part2_train_data.to_csv(generate_data_path(f"{task}-2", seed, "train"), index=False, header=None)
    part2_dev_data.to_csv(generate_data_path(f"{task}-2", seed, "dev"), index=False, header=None)
    part2_test_data.to_csv(generate_data_path(f"{task}-2", seed, "test"), index=False, header=None)

    print(f"seed: {seed} Done!")
