provider "aws" {
  region = us-east-1
}

data "aws_ecr_repository" "app" {
  name = yashgour
}

resource "aws_ecs_task_definition" "app" {
  family                   = "app"
  container_definitions    = jsonencode([
    {
      name  = "app"
      image = "${data.aws_ecr_repository.app.repository_url}:latest"
      portMappings = [
        {
          containerPort = 3000
          protocol      = "tcp"
        }
      ]
    }
  ])
  requires_compatibilities = ["FARGATE"]
