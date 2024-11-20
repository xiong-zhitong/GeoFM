export CUDA_VISIBLE_DEVICES=0
export GEO_BENCH_DIR=/home/zhitong/Datasets/geobench/
export DATA_CONFIG_DIR=/home/zhitong/OFALL/OFALL_baseline/mae/DOFA-pytorch/foundation_models/PanOpticOn/dinov2/configs/data/

model=panopticon_cls
dataset=geobench_eurosat_13
task=classification
batch_size=64
lr=0.5
epochs=50

torchrun --nproc_per_node=1 --master_port=25673 src/main.py \
--output_dir logs/"${model}_${dataset}_${blr}_${batch_size}_${epochs}" \
--model $model \
--dataset $dataset \
--task $task \
--num_workers 8 \
--batch_size $batch_size \
--epochs $epochs \
--lr $lr \
--warmup_epochs 0 \
--seed 42
