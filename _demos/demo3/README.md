
# Terraform-demo

This demo will be a standalone exercise by the intstructor for showcasing how you can work with modules.

It will cover:
- Using a local custom module
- Editing modules
- Calling resources within a module, for example using the --replace flag
- Creating a custom module
- Reviewing a local tfstate file
- Using some commands like:

```bash
  terraform apply -replace=module.example.aws_instance.example
  terraform destory
  terraform state rm
  terraform import
  terraform taint
```