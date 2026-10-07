#
counter=0
for task in farexstance
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
              TAG="${task}_train_no-demo_cpt200" \
              TYPE=prompt \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL='/home/user2/fnlp/pet/pet/new_model400it_200/' \
              bash run_experiment_train.sh "--mapping_path my_auto_label_mapping_cpt_200it/manual_template/farexstance/16-$seed.sort.txt --mapping_id 0"
              sleep 120s
              ((counter++))
              if (( counter % 10 == 0 )); then
                sleep 600s
              fi
          done
      done
  done
done
sleep 1h
#
counter=0
for task in farexstance
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
              TAG="${task}_train_demo_cpt200" \
              TYPE=prompt-demo \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL='/home/user2/fnlp/pet/pet/new_model400it_200/' \
              bash run_experiment_train.sh "--mapping_path my_auto_label_mapping_cpt_200it/manual_template/farexstance/16-$seed.sort.txt --mapping_id 0"
              sleep 120s
              ((counter++))
              if (( counter % 10 == 0 )); then
                sleep 600s
              fi
          done
      done
  done
done
