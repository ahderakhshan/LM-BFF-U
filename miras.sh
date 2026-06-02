

for seed in 13 21 42 87 100
do
    for bs in 8
    do
        for lr in 5e-5
        do
            TAG=miras_with_demo_no_filter \
            TYPE=prompt \
            TASK=parsinlu-food-sentiment \
            BS=$bs \
            LR=$lr \
            SEED=$seed \
            MODEL=/home/user2/.cache/huggingface/hub/models--xlm-roberta-large/snapshots/c23d21b0620b635a76227c604d44e43a9f0ee389 \
            bash run_experiment.sh
        done
    done
done