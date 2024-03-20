 
resource "aws_s3_bucket" "name" {

    bucket = "hydcat2222"
  
}

# Here we create a s3 bucket hydcat2222 in main.tf . This is a default workspace. Type 'terraform workspace' (without quotes) in the git bash command lane to get the following subcommands:

# delete
# list
# new
# select
# show

# Here we create a new workspace by typing " terraform workspace new 'name' " (without quotes). Here we type dev in the name section to create a workspace called dev whose directory is created
# in terraform.tfstate.d . When the above command is executed we switch from default workspace to the dev workspace.Now change the bucket name to hydcat4444 in the same main.tf

#resource "aws_s3_bucket" "name" {

#    bucket = "hydcat4444"
  
#}  

# we apply terraform apply here hence a new bucket hydcat4444 is created in the dev workspace.

# Once again we create a new workspace by typing " terraform workspace new 'name' " (without quotes). Here we type prod in the name section to create a workspace called prod whose directory is created
# in terraform.tfstate.d . When the above command is executed we switch from dev workspace to the prod workspace.Now change the bucket name to hydcat6666 in the same main.tf

#resource "aws_s3_bucket" "name" {

#    bucket = "hydcat6666"
  
#}  

# we apply terraform apply here hence a new bucket hydcat6666 is created in the prod workspace.

# Now default workspace has hydcat2222 bucket
#     dev     workspace has hydcat4444 bucket
#     prod    workspace has hydcat6666 bucket

# to switch between workspaces we can " terraform workspace select 'name' " (without quotes)
# All workspaces use the same main.tf . Each workspace is like opening a new tab in your browser. In this case default tab, dev tab and prod tab alongside each side.
# You do your dev work in dev tab, prod work in prod tab and default work in default tab. In other words these tabs are isolated from each other.
# You cannot delete all the buckets by switching to the default workspace as it contains only the hydcat2222 bucket. When deleting the hydcat6666bucket you must be in the prod workspace.
# Similarly When deleting the hydcat4444 bucket you must be in the dev workspace. This is the concept of workspaces.

