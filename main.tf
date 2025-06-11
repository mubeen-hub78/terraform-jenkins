resource "local_file" "devops" {
  filename = "explicit.txt"
  content  = "explicit test id is ${random_pet.devops.id}"
  depends_on = [ random_pet.devops ]
}
resource "random_pet" "devops" {
  prefix    = "mr"
  separator = "."
  length    = "1"
}
output "devops" {
  value = random_pet.devops
}
