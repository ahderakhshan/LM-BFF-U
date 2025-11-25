

for seed in 13 55 42 87 100
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
            MODEL=FacebookAI/xlm-roberta-large \
            bash run_experiment.sh
        done
    done
done