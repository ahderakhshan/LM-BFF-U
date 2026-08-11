#
counter=0
for task in farstail
do
  for seed in 13 21 42 87 100
  do
      for bs in 2 4 8
      do
          for lr in 1e-5 2e-5 4e-5
          do
              if ((counter < 25)); then
                ((counter++))
                continue
              fi
              TAG="${task}_train_no-demo1" \
              TYPE=prompt \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_train.sh "--mapping_path final_label_mapping/farstail/16-$seed.sort.txt --mapping_id 0"
              sleep 120s
              ((counter++))
              if (( counter % 10 == 0 )); then
                sleep 600s
              fi
          done
      done
  done
done
counter=0
sleep 1800s
for task in farstail
do
  for seed in 13 21 42 87 100
  do
      for bs in 2 4 8
      do
          for lr in 1e-5 2e-5 5e-5
          do
              TAG="${task}_train_demo1" \
              TYPE=prompt-demo \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_train.sh "--mapping_path final_label_mapping/farstail/16-$seed.sort.txt --mapping_id 0"
              sleep 120s
              ((counter++))
              if (( counter % 10 == 0 )); then
                sleep 600s
              fi
          done
      done
  done
done
