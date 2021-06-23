<template>
  <div>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    />

    <form>
      <div class="form-group">
        <label for="Name">Name</label>
        <input
          type="text"
          class="form-control"
          placeholder="Name"
          v-model="newUser"
        />
      </div>
      <div class="form-group">
        <label for="Name">E-Mail Address</label>
        <input
          type="text"
          class="form-control"
          placeholder="Enter email"
          v-model="newEmail"
        />
      </div>
      <button
        type="button"
        class="btn btn-primary"
        v-on:click="createRegAndLogin()"
      >
        Submit
      </button>
    </form>
  </div>
</template>

<script>
export default {
  props: ["usernames", "user_id"],
  data() {
    return {
      newUser: "",
      newEmail: "",
    };
  },
  mounted() {},
  methods: {
    createRegAndLogin() {
      let data = new FormData();
      data.append("name", this.newUser);
      data.append("email", this.newEmail);
      data.append("password", this.newEmail);
      data.append("password_confirmation", this.newEmail);
      data.append("user_type", "guest")

      axios
        .post(`http://127.0.0.1:8000/register`, data)
        .then((response) => {
          window.location.href = "/chat";
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>