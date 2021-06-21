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
                <label for="username_1">Select Inbox ID</label>
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
        
          <div v-for="message in messages">
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
      inbox_id: "2",
      connEnable: false,
    };
  },
  mounted() {},
  methods: {
    connection() {
      this.connEnable = true;
      this.getMessages();
      // Echo.channel(`chat`).listen("NewChatMessage", (e) => {          // Public  Channel
      Echo.private("chatuser." + this.inbox_id).listen("OrderShipped", (e) => {
        this.messages.push({ message: this.newMessage, username: this.user_name });
        this.getMessages();
      });
    },
    submit() {
      axios
        .post(`/api/message`, {
          user_id: this.id,
          recipient_id: "2",
          user_name: this.user_name,
          message: this.newMessage,
          chatroom_id: this.inbox_id,
        })
        .then(
          (response) => {
            this.messages.push({
              message: this.newMessage,
              username: this.user_name,
            });
            this.newMessage = "";
          },
          (error) => {
            console.log(error);
          }
        );
    },
    getMessages() {
      axios
        .get("/api/getmessage/" + this.inbox_id)
        .then((response) => {
          this.messages = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>