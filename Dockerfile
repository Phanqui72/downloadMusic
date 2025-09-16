# ----- Giai đoạn 1: Build (Sử dụng Maven và JDK 17) -----
# Base image này chứa cả Maven và OpenJDK 17, khớp với cấu hình trong pom.xml của bạn
FROM maven:3.8-openjdk-17 AS builder

# Thiết lập thư mục làm việc bên trong container
WORKDIR /app

# 1. Sao chép file pom.xml trước để tận dụng layer cache của Docker.
#    Bước 'mvn dependency:go-offline' sẽ chỉ chạy lại khi file pom.xml thay đổi.
COPY pom.xml .
RUN mvn dependency:go-offline

# 2. Sao chép toàn bộ source code
COPY src ./src

# 3. Build dự án, bỏ qua các bài test.
#    Lệnh này sẽ tạo ra file 'download-app.war' trong thư mục /app/target/
RUN mvn package -DskipTests


# ----- Giai đoạn 2: Production (Sử dụng Tomcat 10.1 trên JRE 17) -----
# Sử dụng image Tomcat 10.1, tương thích với Jakarta EE 10 và chạy trên Java 17
FROM tomcat:10.1-jre17-temurin

# Xóa các ứng dụng mặc định của Tomcat để giảm kích thước image và tăng bảo mật
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép file .war đã được build từ giai đoạn 1 vào thư mục webapps của Tomcat.
# Đổi tên thành ROOT.war để ứng dụng chạy ngay tại địa chỉ gốc của Render
# (ví dụ: https://your-app.onrender.com/ thay vì https://your-app.onrender.com/download-app/)
COPY --from=builder /app/target/download-app.war /usr/local/tomcat/webapps/ROOT.war

# Lệnh khởi động cho container.
# Render sẽ cung cấp một biến môi trường tên là $PORT.
# Lệnh này sẽ tìm và thay thế cổng mặc định 8080 của Tomcat bằng cổng của Render,
# sau đó khởi động server.
CMD ["sh", "-c", "sed -i 's/8080/${PORT}/g' /usr/local/tomcat/conf/server.xml && catalina.sh run"]