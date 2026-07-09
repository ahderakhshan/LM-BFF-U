#
for task in farstail
do
  for seed in 13
  do
      for bs in 2
      do
          for lr in 1e-5
          do
              TAG="${task}_train_no-demo" \
              TYPE=prompt \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_train.sh "--mapping_path final_label_mapping/farstail/16-$seed.sort.txt --mapping_id 0"
              sleep 180s
          done
      done
  done
done
#for task in farstail
#do
#  for seed in 13 21 42 87 100
#  do
#      for bs in 2 4
#      do
#          for lr in 1e-5 2e-5 5e-5
#          do
#              TAG="${task}_train_demo" \
#              TYPE=prompt-demo \
#              TASK="${task}" \
#              BS=$bs \
#              LR=$lr \
#              SEED=$seed \
#              MODEL=FacebookAI/xlm-roberta-large \
#              bash run_experiment_train.sh "--mapping_path final_label_mapping/farstail/16-$seed.sort.txt --mapping_id 0"
#              sleep 180s
#          done
#      done
#  done
#done
