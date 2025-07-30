

echo --- Building Docker Image ---
docker build -t europe-west1-docker.pkg.dev/brain-staging-450115/clickhouse-analytics/clickhouse-analytics .

echo.
echo --- Pushing Docker Image to GCR ---
docker push europe-west1-docker.pkg.dev/brain-staging-450115/clickhouse-analytics/clickhouse-analytics

echo.
echo --- Script finished ---