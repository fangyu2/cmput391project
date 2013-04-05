package cmput391;

public class Record {
	
	private int recordID;

	public Record(int record) {
		this.recordID = record;
	}

	/**
	 * sets the record id of current record as provided
	 * @param record
	 */
	public void setRecordID(int record) {
		this.recordID = record;
	}

	/**
	 * 
	 * @return current record id
	 */
	public int getRecordID() {
		return recordID;
	}
}
