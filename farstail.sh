

for seed in 87
do
    for bs in 8
    do
        for lr in 5e-5
        do
            TAG=farstail_demo_no_filter \
            TYPE=prompt-demo \
            TASK=farstail \
            BS=$bs \
            LR=$lr \
            SEED=$seed \
            MODEL=/kaggle/working/all_minilm/bert-base-parsbert-uncased \
            bash run_experiment.sh
        done
    done
done