#
sleep 2h
python ./tools/sort_mapping.py --condition "{'task_name': 'sentipers_multiclass', 'tag': 'exp-mapping-sentipers_multiclass-cpt400'}" --log ./log   --mapping_dir ./my_auto_label_mapping_cpt_400it/manual_template/

counter=0
for task in sentipers_multiclass
do
  for seed in 13 21 42 87 100
  do
      for bs in 2 4 8
      do
          for lr in 1e-5 2e-5 5e-5
          do
#              if ((counter < 25)); then
#                ((counter++))
#                continue
#              fi
              TAG="${task}_train_no-demo_cpt400" \
              TYPE=prompt \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL='/home/user2/fnlp/pet/pet/new_model400it_400/' \
              bash run_experiment_train.sh "--mapping_path my_auto_label_mapping_cpt_400it/manual_template/sentipers_multiclass/16-$seed.sort.txt --mapping_id 0"
              sleep 60s
              ((counter++))
              if (( counter % 10 == 0 )); then
                sleep 600s
              fi
          done
      done
  done
done
#sleep 1h
#
counter=0
for task in sentipers_multiclass
do
  for seed in 13 21 42 87 100
  do
      for bs in 2 4 8
      do
          for lr in 1e-5 2e-5 5e-5
          do
#              if ((counter < 25)); then
#                ((counter++))
#                continue
#              fi
              TAG="${task}_train_demo_cpt400" \
              TYPE=prompt-demo \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL='/home/user2/fnlp/pet/pet/new_model400it_400/' \
              bash run_experiment_train.sh "--mapping_path my_auto_label_mapping_cpt_400it/manual_template/sentipers_multiclass/16-$seed.sort.txt --mapping_id 0"
              sleep 60s
              ((counter++))
              if (( counter % 10 == 0 )); then
                sleep 600s
              fi
          done
      done
  done
done
