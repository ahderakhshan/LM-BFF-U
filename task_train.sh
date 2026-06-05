
for task in miras-sparrow farstail farexstance
do
  for seed in 13 21 42 87 100
  do
      for bs in 8
      do
          for lr in 5e-5
          do
              TAG="${task}_train_no-demo" \
              TYPE=prompt \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_train.sh
          done
      done
  done
done


for task in miras-sparrow farstail farexstance
do
  for seed in 13 21 42 87 100
  do
      for bs in 8
      do
          for lr in 5e-5
          do
              TAG="${task}_train_demo" \
              TYPE=prompt-demo \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_train.sh
          done
      done
  done
done