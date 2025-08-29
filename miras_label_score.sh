for mapping_id in {0..10}
do
    for seed in 13 21 42 87 100
    do
        # To save time, we fix these hyper-parameters
        bs=8
        lr=1e-5

        # Since we only use dev performance here, use --no_predict to skip testing
        TAG=exp-mapping \
        TYPE=prompt \
        TASK=miras-sparrow \
        BS=$bs \
        LR=$lr \
        SEED=$seed \
        MODEL=/kaggle/working/all_minilm/roberta-fa-zwnj-base \
        bash run_experiment.sh "--mapping_path my_auto_label_mapping/manual_template/miras-sparrow/16-$seed.txt --mapping_id $mapping_id --no_predict"
    done
done