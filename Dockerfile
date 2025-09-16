# --- GIAI ĐOẠN 1: BUILD ỨNG DỤNG VỚI MAVEN ---
# Sử dụng image Maven chính thức với JDK 17, tương thích với cấu hình trong pom.xml
FROM maven:3.9-eclipse-temurin-17 AS builder

# Thiết lập thư mục làm việc bên trong container
WORKDIR /app

# Sao chép tệp pom.xml để tải các dependency
# Tận dụng cơ chế cache của Docker, bước này sẽ chỉ chạy lại khi pom.xml thay đổi
COPY pom.xml .
RUN mvn dependency:go-offline

# Sao chép toàn bộ mã nguồn của dự án vào container
COPY src ./src

# Chạy lệnh build của Maven để đóng gói ứng dụng thành file .war
# Kết quả sẽ được lưu trong thư mục /app/target/
RUN mvn package -DskipTests


# --- GIAI ĐOẠN 2: TẠO IMAGE CHẠY ỨNG DỤNG ---
# Sử dụng image Tomcat 10.1 hỗ trợ Jakarta EE 10 và chạy trên JDK 17
FROM tomcat:10.1-jdk17-temurin

# Xóa các ứng dụng mặc định trong thư mục webapps của Tomcat để image gọn nhẹ hơn
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép file .war từ giai đoạn 'builder' vào thư mục webapps của Tomcat
# Đổi tên thành ROOT.war để ứng dụng chạy tại context path gốc (http://localhost:8080/)
COPY --from=builder /app/target/download-app.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080 để có thể truy cập ứng dụng từ bên ngoài container
EXPOSE 8080

# Lệnh CMD mặc định của image tomcat sẽ tự khởi động server,
# vì vậy chúng ta không cần thêm CMD ở đây.