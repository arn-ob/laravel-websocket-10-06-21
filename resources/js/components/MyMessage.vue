<template>
    <div class="is-clearfix">
        
        <div class="notification is-primary is-pulled-right">
            <small>Sent by {{ user }}</small><br />
            {{ message }}
        </div>
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