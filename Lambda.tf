
# S3 bucket defined
resource "aws_s3_bucket" "example_bucket" {
  bucket = "ImageServer-s3-bucket"  
}

# Lambda execution role
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

# Policy to Lambda execution role
resource "aws_iam_policy_attachment" "lambda_s3_policy_attachment" {
  name       = "lambda_s3_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  roles      = [aws_iam_role.lambda_role.name]
}

# Define Lambda function
resource "aws_lambda_function" "Image-processor" {
  filename      = "lambda_function.zip"  # Path to Lambda function code ZIP file
  function_name = "image_processor"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8" 
  source_code_hash = filebase64sha256("lambda_function.zip")
}

# S3 bucket notification
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.example_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.image_processor.arn
    events              = ["s3:ObjectCreated:*"]
  }
}

# RDS instance
resource "aws_db_instance" "example_db" {
  identifier            = "ImageServer-db"
  allocated_storage     = 20
  storage_type          = "gp2"
  engine                = "mysql"
  engine_version        = "5.7"
  instance_class        = ""db.t3a.large""
  name                  = "exampledb"
  username              = "admin"
  password              = "admin123" 
  publicly_accessible  = false 
}
