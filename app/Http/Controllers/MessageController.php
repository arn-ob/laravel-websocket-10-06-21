<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Events\OrderShipped;
use App\Models\ChatMessage;

class MessageController extends Controller
{
    public function broadcast(Request $request) {

        if (! $request->filled('message')) {
            return response()->json(['message' => 'No message to send'], 422);
        }

        $newMessage = new ChatMessage();
    	$newMessage->user_id = $request->user_id;
        $newMessage->recipient_id = $request->recipient_id;
        $newMessage->username = $request->user_name;
    	$newMessage->chatroom_id = $request->chatroom_id;
        $newMessage->socket_id = $request->socket_id;
    	$newMessage->message = $request->message;
    	$newMessage->save();

        event(new OrderShipped($newMessage)); // Private Channel

        return response()->json(["broadcast" => "true"], 200);
    }

    /**
     * 
     */
    public function getmessage(Request $request) {
        // Checking chatroom
        // error_log($request->chatroom);
        // return ChatMessage::join("users", "chatroom.id", "=", "users.id")->where('chatroom_id', $request->chatroom)->get();
        return DB::Table("chat_messages")
            ->join('users', "users.id", "=", "chat_messages.user_id")
            ->where('chat_messages.chatroom_id', $request->chatroom)
            ->get();
    }

    /**
     * @param Request Socket ID
     */
    public function updatedChatRoom(Request $request) {
        return ChatMessage::where('user_id', $request->user_id)
            ->update(["chatroom_id" => $request->socketID]);
    }

    /**
     * @param 
     */
    public function getAllChatRoom(Request $request) {
        $list =  ChatMessage::all()->unique("chatroom_id");
        $listing = collect();
        foreach ($list as $list) {
            $listing->push($list);
        }
        return ["chatroom" => $listing];
    }

}