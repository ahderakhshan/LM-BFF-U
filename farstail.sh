

for seed in 13
do
    for bs in 8
    do
        for lr in 1e-5
        do
            TAG=farstail_roberta_demo_no_filter \
            TYPE=prompt-demo \
            TASK=farstail \
            BS=$bs \
            LR=$lr \
            SEED=$seed \
            MODEL=/kaggle/working/all_minilm/roberta-fa-zwnj-base \
            bash run_experiment.sh
        done
    done
done