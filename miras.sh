

for seed in 13 21
do
    for bs in 8
    do
        for lr in 1e-5
        do
            TAG=miras_with_demo_no_filter \
            TYPE=prompt-demo \
            TASK=miras-sparrow \
            BS=$bs \
            LR=$lr \
            SEED=$seed \
            MODEL=/kaggle/working/all_minilm/roberta-fa-zwnj-base \
            bash run_experiment.sh
        done
    done
done