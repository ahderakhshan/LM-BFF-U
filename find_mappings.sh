for mapping_id in {0..99}
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
        MODEL=xlm-roberta-large \
        bash run_experiments_find_mappings.sh "--mapping_path my_auto_label_mapping/manual_template/miras-sparrow/16-$seed.txt --mapping_id $mapping_id --no_predict"
        sleep 60s
    done
done