provider "null" {}

resource "null_resource" "ssh_to_server" {
  # サーバーにSSH接続し、/var/log/messagesの内容を取得するローカルコマンドを実行
  provisioner "local-exec" {
    command = <<-EOT
      sshpass -p "password" ssh admin@192.168.10.1 "cat /var/log/messages"
    EOT
  }

  # プロビジョナが実行されるタイミングを設定
  triggers = {
    always_run = "${timestamp()}"
  }
}
