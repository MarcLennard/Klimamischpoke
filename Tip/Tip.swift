//
//  Tip.swift
//  Tip
//
//  Created by Kevin Klaebe on 26.09.20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct TipEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack (alignment: .leading){
            Spacer()
            HStack {
                Image(systemName: "lightbulb")
                    .foregroundColor(Color.init(red: 0.13, green: 0.54, blue: 0.13))
                Text("Joveler Klimatipp")
                    .bold()
                    .font(.system(size: 10))
                    .foregroundColor(Color.init(red: 0.13, green: 0.54, blue: 0.13))
            }
            Text("\nBei 30°C waschen spart jährlich 20kg CO₂")
                .font(.system(size: 15))
            Spacer()
        }
        .padding()
    }
}

@main
struct Tip: Widget {
    let kind: String = "Tip"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TipEntryView(entry: entry)
        }
        .configurationDisplayName("Spartipp des Tages")
        .description("Dieses Widget zeigt dem Nutzer einen zufälligen CO2-Spar Tipp des Tages")
        .supportedFamilies([.systemSmall])
    }
}

struct Tip_Previews: PreviewProvider {
    static var previews: some View {
        TipEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
