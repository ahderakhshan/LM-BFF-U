

for seed in 13
do
    for bs in 2
    do
        for lr in 1e-5
        do
            TAG=farstail_demo_no_filter \
            TYPE=prompt \
            TASK=farstail \
            BS=$bs \
            LR=$lr \
            SEED=$seed \
            MODEL=/kaggle/working/all_minilm/bert-base-parsbert-uncased \
            bash run_experiment.sh
        done
    done
done