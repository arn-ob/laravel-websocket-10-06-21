<template>
  <div>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    />

    <div class="box">
      <div class="form-group">
        
        <div style="margin-bottom: 20px">
          <label for="username_1">Your name</label>
          <input
            type="text"
            class="form-control"
            v-model="user_name"
            style="margin-bottom: 5px"
          />
          <button 
            type="button" 
            class="btn btn-primary" 
            v-on:click="connection()"
          > Join </button>
        </div>

        <!-- <p v-if="!messages.length">Start typing the first message</p> -->

        <div v-for="message in messages">
          <my-message
            v-if="message.user == user_name"
            :message="message.text"
            :user="message.user"
          ></my-message>

          <message
            v-if="message.user != user_name"
            :message="message.text"
            :user="message.user"
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
</template>

<script>
export default {
  props: ['usernames', 'user_id'],
  data() {
    return {
      id: this.user_id,
      user_name: this.usernames, // Math.random().toString(36).slice(-5),
      messages: [],
      newMessage: "",
      chatroom: "1",
      connEnable: false,
    };
  },
  mounted() {},
  methods: {
    connection() {
      this.connEnable = true 
      // Echo.channel(`chat`).listen("NewChatMessage", (e) => {          // Public  Channel
      Echo.private(`chatuser.`+ this.chatroom).listen("OrderShipped", (e) => {     // Private Channel
        if (e.user != this.user_name) {
          this.messages.push({ text: e.message, user: e.user });
        }
      });
    },
    submit() {
      axios
        .post(`/api/message`, {
          user_id: this.id, 
          user_name: this.user_name,
          message: this.newMessage,
          chatroom_id: this.chatroom
        })
        .then(
          (response) => {
            this.messages.push({
              text: this.newMessage,
              user: this.user_name,
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