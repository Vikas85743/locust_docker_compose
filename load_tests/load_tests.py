from locust import HttpLocust, HttpUser, TaskSet, task, events, between


class JsonAPI(HttpUser):
    wait_time = between(1, 2)

    @task
    def get_posts(self):
        self.client.get("/posts")
        self.client.get("/posts/1/comments")
        self.client.get("/photos")
        self.client.get("/users")
