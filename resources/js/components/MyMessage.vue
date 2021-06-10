<template>
    <div class="is-clearfix">
        <small>Sent by {{ user }}</small><br />
        <div class="notification is-primary is-pulled-right">{{ message }}</div>
    </div>
</template>

<script>
    export default {
        props: [
            'message',
            'user'
        ]
    }
</script>

<style scoped>
    .notification {
        max-width: 80%;
        text-align: right;
        margin-bottom: 1em;
    }
</style>