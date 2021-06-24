<template>
  <div>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    />

    <div class="box">
      <div class="form-group">
        <div style="margin-bottom: 20px">
          <div class="container">
            
            <!-- Information -->
            <div class="row">
              <div class="col-sm">
                <label for="username_1">Your name</label>
                <input
                  type="text"
                  class="form-control"
                  v-model="user_name"
                  style="margin-bottom: 5px"
                />
              </div>
              <div class="col-sm">
                <label for="inbox_id_1">Inbox ID</label>
                <input
                  type="text"
                  class="form-control"
                  v-model="inbox_id"
                  style="margin-bottom: 5px"
                />
              </div>
            </div>

            <button
              style="margin-top: 10px"
              type="button"
              class="btn btn-primary"
              v-on:click="connection()"
            >
              Join
            </button>
          </div>
        </div>

        <div class="container">
          <div v-for="message in messages" :key="message.id">
            <my-message
              v-if="message.username == user_name"
              :message="message.message"
              :user="message.username"
            ></my-message>

            <message
              v-if="message.username != user_name"
              :message="message.message"
              :user="message.username"
            ></message>
          </div>

          <form @submit.prevent="submit" v-if="connEnable == true">
            <div class="field has-addons has-addons-fullwidth">
              <div class="control is-expanded" style="width: 94%">
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
  </div>
</template>

<script>
export default {
  props: ["usernames", "user_id"],
  data() {
    return {
      id: this.user_id,
      user_name: this.usernames, // Math.random().toString(36).slice(-5),
      messages: [],
      newMessage: "",
      inbox_id: String(Number(new Date())),
      connEnable: false,
      socket_id: "",
    };
  },
  mounted() {},
  methods: {
    connection() {
      this.connEnable = true;
      this.getMessages();
      Echo.private("chatuser." + this.inbox_id).listen(".message.broadcasting", (e) => {
        // If data needed
        let data = Array.isArray(e) ? e[0] : {}
        this.messages.push({ 
          username: data?.username || "", 
          message: data?.message || "", 
        });
      });
      this.socket_id = window.Echo.socketId();
    },
    submit() {
      axios
        .post(`/api/message`, {
          user_id: this.id,
          recipient_id: "1",
          user_name: this.user_name,
          message: this.newMessage,
          chatroom_id: this.inbox_id,
          socket_id: this.socket_id,
        })
        .then(
          (response) => {
            this.newMessage = "";
          },
          (error) => {
            console.log(error);
          }
        );
    },
    getMessages() {
      axios
        .get(`/api/getmessage/${this.inbox_id}`)
        .then((response) => {
          this.messages = response.data;
          console.log("Get Message ", this.messages)
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>