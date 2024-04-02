package kafka

object Kafka {
  def main(args: Array[String]): Unit = {
    println("SUCCESS: Running main method in Kafka object!")
    println("Command line arguments provided:")

    for (arg <- args) {
      println(arg)
    }
  }
}
