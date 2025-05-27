terraform {
  source = "../modules/github-repo"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-backend-ayush-bucket"
    key            = "github/legacy/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-backend-ayush-locks"
  }
}

inputs = {
  repositories = {
    cpp_library_dsa = {
      name        = "cpp-library-adt-dsa"
      description = "This repository contains C++, HPP, and EXE files for various ADTs and DSs."
      visibility  = "public"
      archived    = false
      topics      = ["cpp", "adt", "data-structures", "legacy"]
    }

    polish_converter = {
      name        = "cpp-polish-reverse-polish-converter"
      description = "Converter for infix to Reverse Polish & Polish notation using C++"
      visibility  = "private"
      archived    = false
      topics      = ["cpp", "notation", "school-project", "legacy"]
    }

    sorting_techniques = {
      name        = "cpp-sorting-techniques"
      description = "Comparison-based and index-based sorting algorithms in C++"
      visibility  = "private"
      archived    = false
      topics      = ["cpp", "sorting", "algorithms", "legacy"]
    }

    java_learning = {
      name        = "java-learning-problems"
      description = "Java DSA + OOP problems for interviews"
      visibility  = "public"
      archived    = false
      topics      = ["java", "learning", "archive", "legacy"]
    }

    projects_in_c = {
      name        = "c-language-projects"
      description = "C language projects from coursework"
      visibility  = "public"
      archived    = false
      topics      = ["c", "school-project", "legacy"]
    }
  }

  # Shared config (can also move to a root terragrunt.hcl later)
  has_issues                         = true
  has_projects                       = true
  has_wiki                           = true
  auto_init                          = true
  allow_squash_merge                = true
  allow_merge_commit                = true
  allow_rebase_merge                = true
  secret_scanning                   = true
  secret_scanning_push_protection   = true
}


