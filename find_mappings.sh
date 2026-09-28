counter=0
for mapping_id in {0..19}
do
    for seed in 13 21 42 87 100
    do
#        if ((counter <= 58)); then
#          ((counter++))
#          echo "$counter passed"
#          continue
#        fi
        # To save time, we fix these hyper-parameters
        bs=8
        lr=1e-5

        # Since we only use dev performance here, use --no_predict to skip testing
        TAG=exp-mapping-mirassparrow-cpt200 \
        TYPE=prompt \
        TASK=miras-sparrow \
        BS=$bs \
        LR=$lr \
        SEED=$seed \
        MODEL='/home/user2/fnlp/pet/pet/new_model400it_200/'  \
        bash run_experiments_find_mappings.sh "--mapping_path my_auto_label_mapping_cpt_200it/manual_template/miras-sparrow/16-$seed.txt --mapping_id $mapping_id --no_predict"
        sleep 120s
        ((counter++))
        if (( counter % 10 == 0 )); then
          sleep 900
        fi
    done
done