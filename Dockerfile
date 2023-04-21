FROM openjdk:11-jdk

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos para o diretório de trabalho
COPY src /app/src
COPY target/site/jacoco /app/target/site/jacoco
COPY README.md /app/README.md
COPY mvnw /app/mvnw
COPY mvnw.cmd /app/mvnw.cmd
COPY pom.xml /app/pom.xml
COPY system.properties /app/system.properties

# Executa o build da aplicação
RUN mvn test

# Expõe a porta 8080
EXPOSE 8080

# Define o comando que será executado quando o container for iniciado
CMD ["java", "-jar", "./demo-0.0.1-SNAPSHOT.jar"]
