<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Events\NewChatMessage;
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
    	$newMessage->message = $request->message;
    	$newMessage->save();

        // event(new NewChatMessage($request->message, $request->user_name));  // Public Channel
        event(new OrderShipped($newMessage)); // Private Channel

        return response()->json(["broadcast" => "true"], 200);
    }

    public function getmessage(Request $request, $chatroom) {
        // Checking chatroom
        error_log($chatroom);
        
        return ChatMessage::where('chatroom_id', $chatroom)->get();
    }
}