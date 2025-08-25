

for seed in 13 21 42 87 100
do
    for bs in 8
    do
        for lr in 1e-5 2e-5 5e-5
        do
            TAG=miras_with_demo_no_filter \
            TYPE=prompt \
            TASK=miras-sparrow \
            BS=$bs \
            LR=$lr \
            SEED=$seed \
            MODEL=/kaggle/working/all_minilm/bert-base-parsbert-uncased \
            bash run_experiment.sh
        done
    done
done