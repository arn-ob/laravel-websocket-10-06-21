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
            v-model="userId"
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
  props: ['usernames'],
  data() {
    return {
      userId: this.usernames, // Math.random().toString(36).slice(-5),
      messages: [],
      newMessage: "",
      connEnable: false,
    };
  },
  mounted() {},
  methods: {
    connection() {
      this.connEnable = true 
      // Echo.channel(`chat`).listen("NewChatMessage", (e) => {          // Public  Channel
      Echo.private(`chatuser.`+ this.userId).listen("OrderShipped", (e) => {     // Private Channel
        if (e.user != this.userId) {
          this.messages.push({ text: e.message, user: e.user });
        }
      });
    },
    submit() {
      axios
        .post(`/api/message`, {
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