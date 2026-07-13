counter=0
for mapping_id in {0..19}
do
    for seed in 13 21 42 87 100
    do
        # To save time, we fix these hyper-parameters
        bs=8
        lr=1e-5

        # Since we only use dev performance here, use --no_predict to skip testing
        TAG=exp-mapping-farexstance \
        TYPE=prompt \
        TASK=farexstance \
        BS=$bs \
        LR=$lr \
        SEED=$seed \
        MODEL=xlm-roberta-large \
        bash run_experiments_find_mappings.sh "--mapping_path my_auto_label_mapping/manual_template/farexstance/16-$seed.txt --mapping_id $mapping_id --no_predict"
        ((counter++))
        sleep 150s
        if (( counter % 10 == 0 )); then
          sleep 900
        fi
    done
done