
#for task in miras-sparrow
#do
#  for seed in 13 21 42 87 100
#  do
#      for bs in 8
#      do
#          for lr in 5e-5
#          do
#              TAG="${task}_no-train_no-demo_manuallabel" \
#              TYPE=prompt \
#              TASK="${task}" \
#              BS=$bs \
#              LR=$lr \
#              SEED=$seed \
#              MODEL=FacebookAI/xlm-roberta-large \
#              bash run_experiment_no_train.sh
#          done
#      done
#  done
#done


for task in miras-sparrow
do
  for seed in 13 21 42 87 100
  do
      for bs in 8
      do
          for lr in 5e-5
          do
              TAG="${task}_no-train_demo_manuallabel" \
              TYPE=prompt-demo \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_no_train.sh
          done
      done
  done
done