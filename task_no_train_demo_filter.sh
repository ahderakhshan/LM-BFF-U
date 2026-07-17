for task in miras-sparrow farstail farexstance
do
  for seed in 13
  do
      for bs in 8
      do
          for lr in 5e-5
          do
              TAG="${task}_no-train_demo-filter" \
              TYPE=prompt-demo \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_no_train_demo-filter.sh
              sleep 120s
              ((counter++))
              if (( counter % 10 == 0 )); then
                sleep 900
              fi
          done
      done
  done
done