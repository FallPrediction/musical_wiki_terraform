resource "aws_codedeploy_app" "musical_wiki" {
  compute_platform = "Server"
  name             = "musical_wiki"
}

resource "aws_codedeploy_deployment_group" "musical_wiki_backend" {
  app_name              = aws_codedeploy_app.musical_wiki.name
  deployment_group_name = "musical_wiki_backend"
  service_role_arn      = aws_iam_role.deploy.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "app_server"
    }
  }
}

resource "aws_codedeploy_deployment_group" "musical_wiki_frontend" {
  app_name              = aws_codedeploy_app.musical_wiki.name
  deployment_group_name = "musical_wiki_frontend"
  service_role_arn      = aws_iam_role.deploy.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "app_server"
    }
  }
}
