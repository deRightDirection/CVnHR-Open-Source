﻿using CsvHelper;
using NLog;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;

namespace QNH.Overheid.KernRegister.Business.Utility
{
    public class CsvUtils
    {
        public static IEnumerable<ZipCodeRecord> ReadZipcodeRecords(string fileName)
        {
            // First read complete CSV to see how many KVKnummers we need to process
            IEnumerable<ZipCodeRecord> inschrijvingCsvRecords;
            using (TextReader reader = File.OpenText(fileName))
            {
                //var csv = new CsvReader(reader);
                //csv.Configuration.BadDataFound = null;
                //inschrijvingCsvRecords = csv.GetRecords<ZipCodeRecord>().ToArray();
            }

            return null;
//            return inschrijvingCsvRecords;
        }

        public static IEnumerable<InschrijvingRecord> ReadInschrijvingRecords(string fileName, Logger logger = null)
        {
            var configuratedHeaders = (ConfigurationManager.AppSettings["Csv-possibleheaders"] ?? "kvknummer,dossiernr,inschrijvingnummer")
                    .Split(',')
                    .Select(h => h.ToLowerInvariant());
            // First read complete CSV to see how many KVKnummers we need to process
            IEnumerable<InschrijvingRecord> inschrijvingCsvRecords;
            using (TextReader reader = File.OpenText(fileName))
            {
                //var csv = new CsvReader(reader);
                //csv.Configuration.ReadingExceptionOccurred = (x) => {
                //    logger?.Info($"Error in CSV: {x.GetType()} - {x.Message} for record: {x.ReadingContext.RawRecord}");
                //    return false; // do not throw!
                //};

                //// Setup the matching headers, allow any of the configurated headers to match
                //csv.Configuration.PrepareHeaderForMatch = (string header, int index) => {
                //    logger?.Debug($"Start PrepareHeaderForMatch => header: {header} - index: {index} - configuratedHeaders: {string.Join(", ", configuratedHeaders)}, - delimeter: {csv.Configuration.Delimiter}");
                //    var headerLower = header.ToLowerInvariant();
                //    return configuratedHeaders.Any(h => h == headerLower) ? nameof(InschrijvingRecord.kvknummer) : header;
                //};
                //// Log validate errors for header
                //csv.Configuration.HeaderValidated = (bool success, string[] items, int index, ReadingContext ctx) => {
                //    if (!success) {
                //        logger?.Info($"Could not find header(s). items: {string.Join(",", items)}, index: {index}, for record: {ctx.RawRecord}");
                //    }
                //};

                //// Set BadDataFound to log (and ignore?) bad data.
                //csv.Configuration.BadDataFound = (readingContext) => {
                //    logger?.Info($"Bad data found! Error on record: {readingContext.RawRecord}");
                //};

                //// Set the delimeter so culture is not an issue 
                //// TODO: make configurable
                //csv.Configuration.Delimiter = ",";
                //inschrijvingCsvRecords = csv.GetRecords<InschrijvingRecord>().ToArray();
            }

//            return inschrijvingCsvRecords;
            return null;
        }

        public static byte[] WriteToCsv<T>(IEnumerable<T> records)
        {
            using (var memoryStream = new MemoryStream())
            {
                using (var streamWriter = new StreamWriter(memoryStream))
                    //using (var csvWriter = new CsvWriter(streamWriter))
                    //{
                    //    csvWriter.WriteRecords<T>(records);
                    //} // StreamWriter gets flushed here.
                    return null;
//                return memoryStream.ToArray();
            }
        }
    }
}
