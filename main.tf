resource "local_file" "devops" {
  filename = "devops.txt"
  content  = "terraform task"
}
resource "random_pet" "devops" {
  prefix    = "course"
  separator = "."
  length    = "1"
}
