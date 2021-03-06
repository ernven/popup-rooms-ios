//
//  RoomRow.swift
//  PopUpRooms
//
//  Created by ernven on 24.10.2021.
//

import SwiftUI

// This creates an icon for displaying room status. Could later be moved into own helper file.
@ViewBuilder func setStatusIcon(status: Bool) -> some View {
    
    if !status {
        Image(systemName: "circle.fill")
            .foregroundColor(Color.green)
    } else {
        Image(systemName: "circle.fill")
            .foregroundColor(Color.red)
    }
}

struct RoomRow: View {
    
    @EnvironmentObject var roomData: RoomData
    var room: Room
    
    var roomIndex: Int {
        roomData.rooms.firstIndex(where: { $0.id == room.id })!
    }
    
    var body: some View {
        HStack {
            Text("\(room.floor)")
            Spacer()
            Text("\(room.roomName)")
                .frame(width: 90)
            Spacer()
            setStatusIcon(status: room.busy)
            Spacer()
            StarButton(isSet: $roomData.rooms[roomIndex].starred)
        }
        .padding(.leading, 10).padding(.trailing, 15)
        .imageScale(.large)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12"], id: \.self) { deviceName in

            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environmentObject(RoomData())
        }
    }
}
