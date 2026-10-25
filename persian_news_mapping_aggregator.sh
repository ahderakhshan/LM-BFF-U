counter=0
for mapping_id in {0..99}
do
    for seed in 13 21 42 87 100
    do
        # Since we only use dev performance here, use --no_predict to skip testing
        TAG=exp-mapping-persian_news_tc_aggregator-cpt200 \
        TYPE=prompt \
        TASK=persian_news_tc \
        SEED=$seed \
        BS=2 \
        LR=1e-05 \
        MODEL='/home/user2/fnlp/pet/pet/new_model400it_200/'  \
        bash run_experiment_no_train.sh "--mapping_path my_auto_label_mapping_cpt_400it/manual_template/persian_news_tc_aggregator/16-$seed.txt --mapping_id $mapping_id --no_predict"
    done
done