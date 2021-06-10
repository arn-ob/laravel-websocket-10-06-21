<template>
  <div>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    />

    <div class="box">
      <div class="form-group">
        <label for="username_1">Type Your name</label>
        <input
          type="text"
          class="form-control"
          placeholder="User Name"
          v-model="userId"
          style="margin-bottom: 30px"
        />
        <button v-on:click="connection()">Join</button>

        <!-- <p v-if="!messages.length">Start typing the first message</p> -->

        <div v-for="message in messages">
          <my-message
            v-if="message.user == userId"
            :message="message.text"
            :user="message.user"
          ></my-message>

          <message
            v-if="message.user != userId"
            :message="message.text"
            :user="message.user"
          ></message>
        </div>

        <form @submit.prevent="submit">
          <div class="field has-addons has-addons-fullwidth">
            <div class="control is-expanded">
              <input
                class="input"
                type="text"
                placeholder="Type a message"
                v-model="newMessage"
              />
            </div>
            <div class="control">
              <button
                type="submit"
                class="button is-danger"
                :disabled="!newMessage"
              >
                Send
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      userId: "", // Math.random().toString(36).slice(-5),
      messages: [],
      newMessage: "",
    };
  },
  mounted() {},
  methods: {
    connection() {
      console.log("Connected");
      Echo.private(`chatuser`).listen("OrderShipped", (e) => {
        if (e.user != this.userId) {
          this.messages.push({
            text: e.message,
            user: e.user,
          });
        }
      });
    },
    submit() {
      axios
        .post(`${process.env.MIX_WEBSOCKET_SERVER_BASE_URL}/api/message`, {
          user: this.userId,
          message: this.newMessage,
        })
        .then(
          (response) => {
            // console.log(this.newMessage);
            // console.log(this.userId);

            this.messages.push({
              text: this.newMessage,
              user: this.userId,
            });
            this.newMessage = "";
          },
          (error) => {
            console.log(error);
          }
        );
    },
  },
};
</script>