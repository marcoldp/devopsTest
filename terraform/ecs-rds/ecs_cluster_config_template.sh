#!/bin/bash
echo ECS_CLUSTER=${ecs_cluster} >> /etc/ecs/ecs.config
cat /etc/ecs/ecs.config | grep "ECS_CLUSTER"