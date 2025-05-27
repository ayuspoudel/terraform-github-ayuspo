module "cpp_library_dsa" {
  source        = "../modules/github-repo"
  name          = "cpp-library-adt-dsa"
  description   = "This repository contains C++, HPP, and EXE files for various Abstract Data Types (ADTs) and Data Structures (DSs), including implementations and examples for Binary Trees, Linked Lists, Stacks, Queues, and more."
  visibility    = "public"
  archived      = false
  has_issues    = true
  has_projects  = true
  has_wiki      = true
  topics        = ["cpp", "adt", "data-structures"]
}

module "polish_converter" {
  source        = "../modules/github-repo"
  name          = "cpp-polish-reverse-polish-converter"
  description   = "Infix to Reverse Polish and Polish notation converter implemented in C++ utilizing stacks, queues, and OOP principles for efficient expression parsing and evaluation. A robust tool for mathematical notation conversion."
  visibility    = "private"
  archived      = false
  has_issues    = true
  has_projects  = true
  has_wiki      = true
  secret_scanning = false
  secret_scanning_push_protection = false
  topics        = ["cpp", "stack", "notation", "school-project"]
}

module "sorting_techniques" {
  source        = "../modules/github-repo"
  name          = "cpp-sorting-techniques"
  description   = "This repository contains modular files in C++ for sorting algorithm including comparison based sorts and index based sort. These files can be used as open source tools for sorting by any user for learning purposes."
  visibility    = "private"
  archived      = false
  has_issues    = true
  has_projects  = true
  has_wiki      = true
  secret_scanning = false
  secret_scanning_push_protection = false
  topics        = ["cpp", "sorting", "algorithms"]
}

module "java_learning" {
  source        = "../modules/github-repo"
  name          = "java-learning-problems"
  description   = "This repository has all the required problems and solutions to the basic, intermediate and advanced Java problems for Data Structures, Algorithms, Object Oriented Programming and Technical Interview Preparation"
  visibility    = "public"
  archived      = false
  has_issues    = true
  has_projects  = true
  has_wiki      = false
  topics        = ["java", "learning", "archive"]
}

module "projects_in_c" {
  source        = "../modules/github-repo"
  name          = "c-language-projects"
  description   = "C language projects from earlier coursework"
  visibility    = "public"
  archived      = false
  has_issues    = true
  has_projects  = true
  has_wiki      = true
  topics        = ["c", "school-project"]
}
